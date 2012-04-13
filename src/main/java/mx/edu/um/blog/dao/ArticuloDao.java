/*
 * The MIT License
 *
 * Copyright 2012 Universidad de Montemorelos A. C.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package mx.edu.um.blog.dao;

import java.util.Date;
import java.util.List;
import mx.edu.um.blog.model.Articulo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author J. David Mendoza <jdmendoza@um.edu.mx>
 */
@Repository
@Transactional
public class ArticuloDao {
    private static final Logger log = LoggerFactory.getLogger(ArticuloDao.class);
    @Autowired
    private SessionFactory sessionFactory;
    
    private Session currentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    public Articulo crea(Articulo articulo) {
        articulo.setFecha(new Date());
        currentSession().save(articulo);
        return articulo;
    }
    
    public Articulo actualiza(Articulo articulo) {
        articulo.setFecha(new Date());
        currentSession().update(articulo);
        return articulo;
    }
    
    public String elimina(Long articuloId) {
        Articulo articulo = (Articulo)currentSession().get(Articulo.class, articuloId);
        String titulo = articulo.getTitulo();
        currentSession().delete(articulo);
        return titulo;
    }
    
    public Articulo obtiene(Long articuloId) {
        Articulo articulo = (Articulo)currentSession().get(Articulo.class, articuloId);
        return articulo;
    }
    
    public List<Articulo> lista() {
        Query query = currentSession().createQuery("select a from Articulo a order by fecha desc");
        return query.list();
    }
}
