/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author ivan
 */
public class userBean {
    private String userName;
    private String fullName;
    private String email;
    private String password;
    private boolean autenticated;
    private String userType;
    private String grupo;
    private String institucion;
    private int idUsuario;
    private String unidadAcademica;
    private String profilePict; 
    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the autenticated
     */
    public boolean isAutenticated() {
        return autenticated;
    }

    /**
     * @param autenticated the autenticated to set
     */
    public void setAutenticated(boolean autenticated) {
        this.autenticated = autenticated;
    }

    /**
     * @return the userType
     */
    public String getUserType() {
        return userType;
    }

    /**
     * @param userType the userType to set
     */
    public void setUserType(String userType) {
        this.userType = userType;
    }

    /**
     * @return the grupo
     */
    public String getGrupo() {
        return grupo;
    }

    /**
     * @param grupo the grupo to set
     */
    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    /**
     * @return the institucion
     */
    public String getInstitucion() {
        return institucion;
    }

    /**
     * @param institucion the institucion to set
     */
    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    /**
     * @return the idUsuario
     */
    public int getIdUsuario() {
        return idUsuario;
    }

    /**
     * @param idUsuario the idUsuario to set
     */
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * @return the fullName
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * @param fullName the fullName to set
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * @return the unidadAcademica
     */
    public String getUnidadAcademica() {
        return unidadAcademica;
    }

    /**
     * @param unidadAcademica the unidadAcademica to set
     */
    public void setUnidadAcademica(String unidadAcademica) {
        this.unidadAcademica = unidadAcademica;
    }

    /**
     * @return the profilePict
     */
    public String getProfilePict() {
        return profilePict;
    }

    /**
     * @param profilePict the profilePict to set
     */
    public void setProfilePict(String profilePict) {
        this.profilePict = profilePict;
    }
}
