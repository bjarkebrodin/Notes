# ReactJS Components

A basic react component (in JSX) looks like so.

```javascript
import React from 'react';
class HelloComponent extends React.Component {
    render() {
        return (
            <div>
                Hello, World!
            </div>
        );
    }
}
```

We can tweak the import to clean up the syntax a little -
additionally lets try composing components from above:

```javascript
import React, { Component } from 'react';
class HelloContainer extends Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
            <div>
                {this.props.children}
            </div>
        )
    }
}
class App extends Component {
    render() {
        return (
            <HelloContainer>
                <HelloComponent />
                <HelloComponent />
                <HelloComponent />
            </HelloContainer>
        )
    }
}
```

Additionally, we can use props to add further parameters 
to our components.

```javascript
class PersonCard extends Component {
    render() {
        let {name,age,fave} = {...this.props};
        return(
            <div>
                <hr/>
                <h4>{name}</h4>
                <p>{age} years old</p>
                <p>loves {fave}</p>
                <hr/>
            </div>
        )
    }
}

class App extends Component {
    render() {
        return (
            <div>
                <PersonCard 
                    name="Superdan"
                    age="42"
                    fave="beerpong"
                />
                <PersonCard 
                    name="Cool Guy"
                    age="27"
                    fave="Pizza"
                />
            </div>
        )
    }
}
```

we could further augment our component to include default props

```javascript
class PersonCard extends Component {
    static defaultProps = {
        name: 'person name',
        age: 0,
        fave: 'stuff they like'
    };
    render() {
        let {name,age,fave} = {...this.props};
        return(
            <div>
                <hr/>
                <h4>{name}</h4>
                <p>{age} years old</p>
                <p>loves {fave}</p>
                <hr/>
            </div>
        )
    }
}
```

If we want changeable properties, we use state instead of props.

We can change state through `setState(object)`, this method will merge the object parameter with the current state (only updating specified fields, but keeping the rest). Note that calling `setState` will trigger a call to `render` afterwards, let's see a simple example.

```javascript
class ClickMe extends Component {
    constructor(props) {
        super(props);
        this.state = {counter:0};
    }
    click() {
        this.setState((prev, _) => ({
            counter: prev.counter+1
        }));
    }
    render() {
        return (
            <div>
                <button onClick={this.click.bind(this)}>Click Me!</button>
                <div>{this.state.counter}</div>
            </div>
        )
    }
}

class App extends Component {
    render() {
        return <ClickMe />
    }
}
```