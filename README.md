# Intern Coding Challenge

Welcome to the Plated Summer 2017 engineering intern coding challenge!

## Background

You’re a burgeoning restaurateur who’s about to launch their first restaurant!  We have invited you to bring your restaurant’s offerings into our super exclusive celebrity early access program to use the new Plated Menu API.  With access to that, you will be able to create your own menus of recipes creatively designed by you.  Showcasing them to your adoring customers will be up to you...

## The Task

You must create a functioning client (websites or native applications work great for this) to showcase your culinary vision of new potential menus for your restaurant. We provide the following functionality via our API endpoints:

- Managing and showing your menus
- Managing recipes to be shown on menus

You can use whatever programming languages or frameworks you feel most comfortable with -- please try to impress us!  Our engineers are familiar with most of the top programming languages and related web/mobile frameworks: http://www.tiobe.com/tiobe-index/ although we are most comfortable with Ruby/Rails/Sinatra, Javascript/Node/ReactJS/Angular, Swift/Cocoa, Java/Android, C#/ASP.NET/Unity, Python/Flask, and more.

This exercise is intentionally quite open ended to give you as much flexibility to show off your stuff as you can.  You should emphasize showing us good quality thinking over a large range of skills -- i.e. a few well written classes with great test coverage would be more compelling than multiple clients written in multiple programming languages with poor abstractions.

If you feel like you are doing way too much work for this exercise, feel free to send us what you’ve got at that point, maybe just lightly smooth out any obvious rough edges, and tell us what you would do next if you had more time. Please do not spend any more than 5-6 hours total on this.

## What to Deliver

A functioning client that displays, at least minimally (fancy visual design is not the focus of this exercise and definitely not required or even expected), in whatever fashion you want: the available menus your restaurant has and the recipes for each menu.

You might want an administration backend GUI for yourself to keep your menu up to date (don’t get too hung up on security for this demo) but if you are comfortable managing your data with curl/any other command line api tooling, please at least let us know what curl/etc commands you were using.

To evaluate your work, provide to us your source code, as well as a README containing instructions on how to build/run your client(s)/admin. We will need to be able to verify that what you wrote actually works! Even more bonus points if your solution is already live hosted on some free web service (Heroku works great for simple applications like this).

You can either include all of the source code as a single ZIP file and email it back to your recruitment email thread or invite `platedbay` on Github or BitBucket to your private repository. Please do not make your solution publicly available!

# API Documentation
## Accessing the API

The API is accessible at the following base URL: https://plated-coding-challenge.herokuapp.com

We will provide you with your personal apiToken for communicating with the API service. Every request must have the the following header in order to authenticate properly:

| Name | Value |
| ---- | ----- |
| Authorization | Token token=”{apiToken}” |

All messages sent will be JSON objects describing the request, and all successful (200) responses will be JSON objects or arrays of objects.

## Model Schemas

There are 2 models with all associated REST endpoints:

1. `Menus`
2. `Recipes`

Each follows standard CRUD conventions:
- `GET` to list all available or show a specific model
- `POST` to create a new model
- `PUT/PATCH` to update an existing model
- `DELETE` to remove one

## The models
### Menu
| Property | Type |
| -------- | ---- |
| id | *integer*
| title | *string*

#### List all `Menus`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>GET</td>
    <td>/v1/menus.json</td>
    <td></td>
    <td>
      <pre>
[
  {
    id: integer,
    title: string
  }
]
      </pre>
    </td>
  </tr>
</table>

#### Show a specific `Menu`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>GET</td>
    <td>/v1/menus/{menu_id}.json</td>
    <td></td>
    <td>
      <pre>
{
  id: integer,
  title: string
}
      </pre>
    </td>
  </tr>
</table>

#### Create a new `Menu`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>POST</td>
    <td>/v1/menus.json</td>
    <td>
      <pre>
{
  title: string
}
    </td>
    <td>
      <pre>
{
  id: integer,
  title: string
}
      </pre>
    </td>
  </tr>
</table>


#### Update a specific `Menu`'s title
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>PUT</td>
    <td>/v1/menus/{menu_id}.json</td>
    <td>
      <pre>
{
  title: string
}
    </td>
    <td>
      <pre>
{
  id: integer,
  title: string
}
      </pre>
    </td>
  </tr>
</table>

#### Delete a `Menu`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>DELETE</td>
    <td>/v1/menus/{menu_id}.json</td>
    <td></td>
    <td></td>
  </tr>
</table>

#### List all `Recipes` on a current `Menu`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>GET</td>
    <td>/v1/menus/{menu_id}/recipes.json</td>
    <td>
    <pre>
[
  {
    recipe_id: integer
  }
]
    </pre>
    </td>
    <td></td>
  </tr>
</table>

#### Add a `Recipe` to a `Menu`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>POST</td>
    <td>/v1/menus/{menu_id}/recipes.json</td>
    <td>
    <pre>
{
  recipe_id: integer
}
    </pre>
    </td>
    <td></td>
  </tr>
</table>

#### Remove a `Recipe` from a `Menu`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>DELETE</td>
    <td>/v1/menus/{menu_id}/recipes/{recipe_id}.json</td>
    <td>
    </td>
    <td></td>
  </tr>
</table>

### Recipe
| Property | Type |
| -------- | ---- |
| id | *integer* |
| name | *string* |
| description | *string* |

#### List all `Recipes`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>GET</td>
    <td>/v1/recipes.json</td>
    <td></td>
    <td>
      <pre>
[
  {
    id: integer,
    name: string,
    description: string
  }
]
      </pre>
    </td>
  </tr>
</table>

#### Show a specific `Recipe`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>GET</td>
    <td>/v1/recipes/{recipe_id}.json</td>
    <td></td>
    <td>
      <pre>
{
  id: integer,
  name: string,
  description: string
}
      </pre>
    </td>
  </tr>
</table>

#### Create a new `Recipe`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>POST</td>
    <td>/v1/recipes.json</td>
    <td>
      <pre>
{
  name: string,
  description: string
}
    </td>
    <td>
      <pre>
{
  id: integer,
  name: string,
  description: string
}
      </pre>
    </td>
  </tr>
</table>


#### Update a specific `Recipe`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>PUT</td>
    <td>/v1/recipes/{recipe_id}.json</td>
    <td>
      <pre>
{
  name: string,
  description: string
}
    </td>
    <td>
      <pre>
{
  id: integer,
  name: string,
  description: string
}
      </pre>
    </td>
  </tr>
</table>

#### Delete a `Recipe`
<table>
  <tr>
    <th>Method</th>
    <th>Path</th>
    <th>Parameters</th>
    <th>Returns</th>
  </tr>
  <tr>
    <td>DELETE</td>
    <td>/v1/recipes/{recipe_id}.json</td>
    <td></td>
    <td></td>
  </tr>
</table>
