function convertDistance(from,to) {

    if(!validation(from)){
        return false;
    }
    console.log('program is work!')

    let converterOption = document.querySelector('.select-property.select-property').value;

    let coefficient = 0;

    //find conversion type
    switch (converterOption) {
        case 'inches-to-centimeters':
            coefficient = 2.54;
            break
        case 'feet-to-centimeters':
            coefficient = 30.48;
            break
        case 'yards-to-meters':
            coefficient = 0.9144;
            break
        case 'miles-to-kilometers':
            coefficient = 1.609344;
            break
        default:
            alert('Ops! Something went wrong, please try again!');
            return false;
    }

    // find direction
    if(from.id === 'bValue'){
        coefficient = (1/coefficient);
    }

    to.value = from.value * coefficient;



    console.log(converterOption);
    console.log(from.value);
    console.log(to.value);
}


function validation(from) {
    if(from.value === '' || from.value === null){
        alert('This field cannot be empty!');
        return false;
    }else if(isNaN(from.value)){
        alert('Only number is supported!');
        return false;
    }
    return true;
}