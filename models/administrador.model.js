module.exports = (sequelize, Sequelize) => {
    const Administrador = sequelize.define("usuarios", {
      Nombres: {
        type: Sequelize.STRING,
      },
      Apellidos: {
        type: Sequelize.STRING
      },
      RUT: {
        type: Sequelize.INTEGER
      },
      contraseña: {
        type: Sequelize.STRING
      }, 
      telefono: {
        type: Sequelize.INTEGER
      },
      RUT_administrador: {
        type: Sequelize.INTEGER
      },
    });
    return Usuarios;
  };
