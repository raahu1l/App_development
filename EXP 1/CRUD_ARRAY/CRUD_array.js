const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let items = ['Item 1', 'Item 2', 'Item 3'];

function createItem(item) {
  items.push(item);
  console.log('Added:', item);
}

function readItems() {
  if (items.length === 0) {
    console.log('Array is empty.');
  } else {
    console.log('Items:');
    items.forEach((item, index) => console.log(`[${index}]: ${item}`));
  }
}

function updateItem(index, newItem) {
  if (Number.isInteger(index) && index >= 0 && index < items.length) {
    console.log(`Updating index ${index} from "${items[index]}" to "${newItem}"`);
    items[index] = newItem;
  } else {
    console.log('Invalid index');
  }
}

function deleteItem(index) {
  if (Number.isInteger(index) && index >= 0 && index < items.length) {
    const removed = items.splice(index, 1);
    console.log('Deleted:', removed[0]);
  } else {
    console.log('Invalid index');
  }
}

function ask(question) {
  return new Promise(resolve => rl.question(question, resolve));
}

async function main() {
  while (true) {
    console.log('\nOptions:');
    console.log('1 - Create');
    console.log('2 - Read');
    console.log('3 - Update');
    console.log('4 - Delete');
    console.log('5 - Exit');

    const option = await ask('Choose option: ');
    switch (option) {
      case '1': {
        const newItem = await ask('Enter new item: ');
        createItem(newItem);
        break;
      }
      case '2': {
        readItems();
        break;
      }
      case '3': {
        if (items.length === 0) {
          console.log('Array is empty, nothing to update.');
          break;
        }
        readItems();
        let index = parseInt(await ask('Enter index to update (0-based): '), 10);
        if (isNaN(index)) {
          console.log('Invalid index input');
          break;
        }
        let newValue = await ask('Enter new value: ');
        updateItem(index, newValue);
        break;
      }
      case '4': {
        if (items.length === 0) {
          console.log('Array is empty, nothing to delete.');
          break;
        }
        readItems();
        let index = parseInt(await ask('Enter index to delete (0-based): '), 10);
        if (isNaN(index)) {
          console.log('Invalid index input');
          break;
        }
        deleteItem(index);
        break;
      }
      case '5': {
        console.log('Exiting...');
        rl.close();
        return;
      }
      default: {
        console.log('Invalid option');
      }
    }
  }
}

main();
