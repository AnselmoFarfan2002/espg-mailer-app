const LINKS = {
    src: (rel, src, id = '', method = 'GET') => { return {
        rel,
        href: process.env.DIR_SERVIDOR + '/' + src + (id ? '/' : '') + id,
        method
    } },

    subSrc: (rel, src, id, subSrc, method = 'GET') => { return {
        rel,
        href: process.env.DIR_SERVIDOR + '/' + src + '/' + id + '/' + subSrc,
        method
    } },

    query: (rel, src, objQuery, method = 'GET') => { 
        let query = '?';
        for(let prop in objQuery) query+=(prop + "=" + objQuery[prop] + "&&");
        if(query.length > 1) query = query.slice(0, query.length - 2);

        return {
            rel,
            href: process.env.DIR_SERVIDOR + '/' + src + query,
            method
        } 
    },
}

module.exports = LINKS;