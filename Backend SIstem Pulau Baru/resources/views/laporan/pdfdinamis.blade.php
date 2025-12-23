<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>{{ $judul ?? 'Laporan Dinamis' }}</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: DejaVu Sans, sans-serif;
            padding: 20px;
            font-size: 12px;
        }

        h3 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 16px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            table-layout: auto; /* AUTO WIDTH */
        }

        th, td {
            border: 1px solid #333;
            padding: 6px;
            text-align: left;
            word-wrap: break-word;
        }

        th {
            background: #e8e8e8;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h3>{{ $judul ?? 'Laporan Dinamis' }}</h3>

<table>

    {{-- AUTO WIDTH --}}
    <colgroup>
        @foreach ($kolomDipilih as $key)
            <col style="width: auto;">
        @endforeach
    </colgroup>

    <thead>
        <tr>
            @foreach ($kolomDipilih as $key)
                <th>{{ $kolom[$key] ?? $key }}</th>
            @endforeach
        </tr>
    </thead>

    <tbody>
        @foreach ($laporan as $item)
            <tr>
                @foreach ($kolomDipilih as $key)
                    <td>{{ $item->$key }}</td>
                @endforeach
            </tr>
        @endforeach
    </tbody>

</table>

</body>
</html>
