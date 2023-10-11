
//Adds item to grid
function addItemToGrid(item,grid) {
    grid.model.append({name: item})
}

//Removes item from grid
function removeItem(index, grid){
    grid.model.remove(index)
}


