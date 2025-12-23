from fastapi import FastAPI, HTTPException
import pickle
import os
from datetime import datetime
import pandas as pd
import calendar

app = FastAPI()

produk_map = {
    1: "Panci_Tinggi_Jawa_16_CM",
    2: "Panci_Tinggi_Jawa_18_CM",
    3: "Panci_Tinggi_Jawa_20_CM",
    4: "Panci_Tinggi_Jawa_22_CM",
    5: "Panci_Tinggi_Jawa_24_CM",
    6: "Dandang_Ekonomi_Jawa_22_CM",
    7: "Dandang_Ekonomi_Jawa_24_CM",
    8: "Dandang_Ekonomi_Jawa_26_CM",
    11: "Dandang_Ekonomi_Jawa_33_CM",
    12: "Dandang_Ekonomi_Jawa_36_CM",
    13: "Dandang_Ekonomi_Jawa_40_CM",
    15: "Dandang_Ekonomi_Jawa_50_CM",
    17: "Kuali_Jawa_30_CM",
}

bulan_id = [
    "", "Januari", "Februari", "Maret", "April", "Mei", "Juni",
    "Juli", "Agustus", "September", "Oktober", "November", "Desember"
]

@app.get("/Prediksi/{product_id}")
def predict_product(product_id: int):

    if product_id not in produk_map:
        return {
        "product_id": -1
        }

    produk_nama = produk_map[product_id]
    model_path = f"model/produk{produk_nama}.pkl"

    if not os.path.exists(model_path):
        raise HTTPException(status_code=404, detail=f"Model untuk {produk_nama} tidak ditemukan")

    with open(model_path, "rb") as f:
        model = pickle.load(f)

    base_year, base_month = 2024, 12
    now = datetime.now()
    diff_months = (now.year - base_year) * 12 + (now.month - base_month)
    if diff_months < 0:
        diff_months = 0
    steps = diff_months + 2

    forecast = model.get_forecast(steps=steps)
    pred_mean = forecast.predicted_mean.tolist()

    hasil_3bulan = pred_mean[-3:]

    start_date = datetime(base_year, base_month, 1)
    forecast_months = pd.date_range(start=start_date, periods=steps, freq="MS") + pd.offsets.MonthBegin(1)
    forecast_months = forecast_months.strftime("%Y-%m").tolist()
    hasil_months_3 = forecast_months[-3:]
    predictions_rounded = [round(x) for x in hasil_3bulan]
    total_prediksi = sum(predictions_rounded)
    
    predicted_months_format = [
        f"{bulan_id[int(m.split('-')[1])]} {m.split('-')[0]}"
        for m in hasil_months_3
    ]

    return {
        "product_id": product_id,
        "product_name": produk_nama.replace("_", " "),
        "base_data_until": f"{base_year}-{base_month:02d}",
        "current_date": now.strftime("%Y-%m"),
        "predicted_months": hasil_months_3,
        "total": round(total_prediksi),
        "predictions": [round(x) for x in hasil_3bulan],
        "predicted_months_format": predicted_months_format
    }
    
    
def predict_single_product(product_id: int):
    if product_id not in produk_map:
        return None

    produk_nama = produk_map[product_id]
    model_path = f"model/produk{produk_nama}.pkl"

    if not os.path.exists(model_path):
        return None

    with open(model_path, "rb") as f:
        model = pickle.load(f)

    base_year, base_month = 2024, 12
    now = datetime.now()
    diff_months = (now.year - base_year) * 12 + (now.month - base_month)
    if diff_months < 0:
        diff_months = 0
    steps = diff_months + 2

    forecast = model.get_forecast(steps=steps)
    pred_mean = forecast.predicted_mean.tolist()
    hasil_3bulan = pred_mean[-3:]

    start_date = datetime(base_year, base_month, 1)
    forecast_months = pd.date_range(start=start_date, periods=steps, freq="MS") + pd.offsets.MonthBegin(1)
    forecast_months = forecast_months.strftime("%Y-%m").tolist()
    hasil_months_3 = forecast_months[-3:]

    predictions_rounded = [round(x) for x in hasil_3bulan]
    total_prediksi = sum(predictions_rounded)
    predicted_months_format = [
        f"{bulan_id[int(m.split('-')[1])]} {m.split('-')[0]}"
        for m in hasil_months_3
    ]

    return {
        "id_barang": product_id,
        "nama_barang": produk_nama.replace("_", " "),
        "bulan_sekarang": now.strftime("%Y-%m"),
        "bulan_prediksi": predicted_months_format,
        "prediksi": predictions_rounded,
        "total": total_prediksi,
    }
    
@app.get("/PrediksiGetAll")
def predict_all_products():
    results = []
    for pid in produk_map.keys():
        pred = predict_single_product(pid)
        if pred:
            results.append(pred)
    return results
    
    
    #.\venv\Scripts\activate
    #uvicorn main:app --reload --port 9000
    #deactivate