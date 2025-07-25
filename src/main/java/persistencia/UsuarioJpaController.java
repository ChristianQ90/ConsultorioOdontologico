/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author hp
 */
public class UsuarioJpaController implements Serializable {

    public UsuarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public  UsuarioJpaController() {
        emf = Persistence.createEntityManagerFactory("ConsultarioOdontologico_PU");
    }

    public void create(Usuario usuario) {
        
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(usuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Usuario usuario) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            usuario = em.merge(usuario);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = usuario.getId_usuario();
                if (findUsuario(id) == null) {
                    throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuario;
            try {
                usuario = em.getReference(Usuario.class, id);
                usuario.getId_usuario();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.", enfe);
            }
            em.remove(usuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Usuario> findUsuarioEntities() {
        return findUsuarioEntities(true, -1, -1);
    }

    public List<Usuario> findUsuarioEntities(int maxResults, int firstResult) {
        return findUsuarioEntities(false, maxResults, firstResult);
    }

    private List<Usuario> findUsuarioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Usuario.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Usuario findUsuario(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Usuario.class, id);
        } finally {
            em.close();
        }
    }
    
    public boolean existeUsuarioAdmin(String rolUsuario) {
        
        EntityManager em = getEntityManager();
        try {
            String jpql = "SELECT u FROM Usuario u WHERE u.rol = :rol";
            List<Usuario> resultados = em.createQuery(jpql, Usuario.class)
                                         .setParameter("rol", rolUsuario)
                                         .setMaxResults(1)
                                         .getResultList();
            if(resultados.size()==0){
                return false;
            }else{
                return true;
            }
        } finally {
            em.close();
        }
    }

    public int getUsuarioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Usuario> rt = cq.from(Usuario.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    List<Usuario> getUsuariosOdontoSinAsignar() {
        
        EntityManager em = getEntityManager();
        List<Usuario> resultados = new ArrayList<Usuario>();
        try {
            /*String jpql = "SELECT u FROM Usuario u WHERE u.rol = 'Odontologo/a' AND u.id_usuario NOT IN " +
                      "(SELECT o.unUsuario.id_usuario FROM Odontologo o WHERE o.unUsuario IS NOT NULL)";*/
            String jpql = "SELECT u FROM Usuario u LEFT JOIN Odontologo o ON o.unUsuario = u " +
              "WHERE u.rol = 'Odontologo/a' AND o.id IS NULL";
            resultados = em.createQuery(jpql, Usuario.class).getResultList();
            
        } finally {
            em.close();
        }
        return resultados;
    }

    List<Usuario> getUsuariosOdonto() {
        
        EntityManager em = getEntityManager();
        List<Usuario> resultados = new ArrayList<Usuario>();
        try {
            String jpql = "SELECT u FROM Usuario u WHERE u.rol = 'Odontologo/a'";
            resultados = em.createQuery(jpql, Usuario.class).getResultList();
            
        } finally {
            em.close();
        }
        return resultados;
    }

    List<Usuario> getUsuariosSecreSinAsignar() {
        
        EntityManager em = getEntityManager();
        List<Usuario> resultados = new ArrayList<Usuario>();
        try {
            String jpql = "SELECT u FROM Usuario u LEFT JOIN Secretario s ON s.unUsuario = u " +
              "WHERE u.rol = 'Secretario/a' AND s.id IS NULL";
            resultados = em.createQuery(jpql, Usuario.class).getResultList();
            
        } finally {
            em.close();
        }
        return resultados;

    }
    
}
