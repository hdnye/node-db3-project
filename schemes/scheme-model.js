const db = require('./../data/config');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
};

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where({ id })
        .first()
        .then((record) => {
            return record !== undefined ? record : null;
        });
}

function findSteps(id) {
    return db('steps AS s')
        .select(['s.id', 's.step_number', 's.instructions', 'schemes.scheme_name'])
        .where('s.scheme_id', id)
        .leftJoin('schemes', 's.scheme_id', 'schemes.id');
}

function add(scheme) {
    return db('schemes')
        .insert(scheme)
        .then((ids) => {
            return findById(ids[0]);
        });
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes);
}

function remove(id) {
    return db('schemes')
        .where({ id })
        .delete()
        .then((record) => (record === 1 ? record : null));
}

   