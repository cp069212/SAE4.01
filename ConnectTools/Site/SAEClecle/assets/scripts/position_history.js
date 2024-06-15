function getPositionHistory() {
    const objectId = document.getElementById('objectId').value;
    fetch(`api/get_position_history.php?object_id=${objectId}`)
    .then(response => response.json())
    .then(data => {
        const historyDiv = document.getElementById('history');
        historyDiv.innerHTML = '';
        if (data.records) {
            data.records.forEach(record => {
                const recordDiv = document.createElement('div');
                recordDiv.textContent = `Position: ${record.position}, Timestamp: ${record.timestamp}`;
                historyDiv.appendChild(recordDiv);
            });
        } else {
            historyDiv.textContent = 'Aucun historique de position trouvé.';
        }
    })
    .catch((error) => {
        console.error('Erreur:', error);
    });
}
