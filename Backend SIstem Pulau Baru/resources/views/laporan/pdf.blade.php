<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Laporan Keuangan</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'DejaVu Sans', sans-serif;
            padding: 20px;
            font-size: 12px;
        }
        
        h3 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 16px;
        }
        
        h4 {
            text-align: center;
            margin: 30px 0 15px 0;
            font-size: 14px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        th, td {
            border: 1px solid #333;
            padding: 8px;
            text-align: right;
        }
        
        th {
            background-color: #e0e0e0;
            font-weight: bold;
        }
        
        td:first-child, 
        th:first-child {
            text-align: center;
        }
        
        .chart-container {
            text-align: center;
            margin-top: 20px;
        }
        
        .chart-container img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <h3>Laporan Keuangan Bulanan</h3>

    <table>
        <thead>
            <tr>
                <th>Waktu</th>
                <th>Uang Masuk</th>
                <th>Uang Keluar</th>
                <th>Laba Bersih</th>
            </tr>
        </thead>
        <tbody>
            @foreach($laporan as $item)
            <tr>
                <td>{{ $item->waktu }}</td>
                <td>{{ number_format($item->cashflowin, 0, ',', '.') }}</td>
                <td>{{ number_format($item->cashflowout, 0, ',', '.') }}</td>
                <td>{{ number_format($item->lababersih, 0, ',', '.') }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h4>Diagram Garis Cashflow &amp; Laba Bersih</h4>
    
    <div class="chart-container">
        <img src="data:image/png;base64,{{ $chartBase64 }}" alt="Chart Laporan" />
    </div>
</body>
</html>