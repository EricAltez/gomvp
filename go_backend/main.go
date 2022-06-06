package main
import (
	"github.com/gin-gonic/gin"
	"github.com/gin-contrib/cors"
)
type User struct {
	Id int `json:"id"`
	Name string `json:"name"`
	Email string `json:"email"`
	Points int `json:"points"`
}
func usersHadler(c *gin.Context) {
	users := []User {
		{10, "James Bond", "jamesbond007@gmail.com", 4},
		{11, "Pink Floyd", "haveacigar@gmail.com", 24},
		{12, "Monkey D Lufy", "pirateking@gmail.com", 2000000},
	}
	c.JSON(200, gin.H{
		"users": users,
	})
}
func main() {
	r := gin.Default()
	r.Use(cors.Default())
	r.GET("/users", usersHadler)
	r.Run(":5000")
}