document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.sort-by-title')

  if (control) {
    control.addEventListener('click', sortRowsByTitle)
    }
});

function sortRowsByTitle() {
  var tableBody = document.querySelector('tbody')

// NodeList
// https://developer.mozilla.org/ru/docs/Web/API/NodeList

  var rows = tableBody.querySelectorAll('tr')
  var sortedRows = []

  for (var i = 0; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  var sortedTable = document.createElement('tbody')

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

tableBody.parentNode.replaceChild(sortedTable, tableBody)

}

function compareRowsAsc(row1, row2) {
    var testTitle1 = row1.querySelector('td').textContent
    var testTitle2 = row2.querySelector('td').textContent
    if (testTitle1 < testTitle2) { return -1; }
    if (testTitle1 > testTitle2) { return 1; }
    return 0
}

function compareRowsDesc(row1, row2) {
    var testTitle1 = row1.querySelector('td').textContent
    var testTitle2 = row2.querySelector('td').textContent
    if (testTitle1 < testTitle2) { return 1; }
    if (testTitle1 > testTitle2) { return -1; }
    return 0
}
