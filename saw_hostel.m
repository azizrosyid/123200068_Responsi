% Carilah alternatif terbaik pemilihan hostel Jepang bagi wisatawan dengan menggunakan
% metode:
% ? Weighted Product, bagi mahasiswa dengan NIM berakhiran angka ganjil
% ? Simple Additive Weighting, bagi mahasiswa dengan NIM berakhiran angka genap
% Ketentuan:
% 1. Ambil data ke 1-50 dari dataset hostel Jepang yang telah disediakan. Kemudian,
% importlah ke matlab
% 2. Data kriteria yang digunakan : price, distance from city center, cleanliness, dan value
% for money.
% 3. Bobot tiap kriteria secara urut, w = 1, 4, 2, 3
% 4. Buatlah GUI sekreatif mungkin, dengan masing-masing komponen tagnya diberi nama
% dengan format tag_3angkaterakhirnim (contoh: tag_119 atau tombol_119)
% 5. Pada jawaban akhirnya, sebutkan juga nama hostelnya.

function datasetResult = saw_hostel(cityPicked)
dataset = get_dataset(cityPicked);
dataset.cleanliness = str2double(dataset.cleanliness);
dataset.valueformoney = str2double(dataset.valueformoney);
datasetSAW = [dataset.price_from dataset.DistanceFromCityCenter_km_ dataset.cleanliness dataset.valueformoney];

weightCriteria = [1, 4, 2, 3];
weightCriteria = weightCriteria ./ sum(weightCriteria);
typeCriteria = ["COST" "COST" "BENEFIT" "BENEFIT"];

[rowLength, columnLength] = size(datasetSAW);

normalizationMatrix = zeros(rowLength, columnLength);
for i = 1 : columnLength
    if typeCriteria(i) == "BENEFIT"
        normalizationMatrix(:, i) = datasetSAW(:, i) ./ max(datasetSAW(:, i));
    else
        normalizationMatrix(:, i) = min(datasetSAW(:, i)) ./ datasetSAW(:, i);
    end
end

resultMatrix = zeros(rowLength, 1);
for i = 1 : rowLength
   resultMatrix(i) = sum(weightCriteria .* normalizationMatrix(i, :)); 
end

datasetResult = dataset;
datasetResult.Result = resultMatrix;
datasetResult = sortrows(datasetResult, "Result", "descend");
end