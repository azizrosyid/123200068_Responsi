function dataset = get_dataset(cityPicked)
dataset = readtable("Dataset Hostel Jepang.xlsx");
dataset = removevars(dataset, ["Var1" "lon" "lat"]);
dataset(dataset.cleanliness == "NA", :) = [];
picked = ismember(dataset.City, cityPicked);
dataset(not(picked), :) = [];
dataset = head(dataset, 50);
end