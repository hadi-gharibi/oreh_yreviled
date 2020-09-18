# Customer Churn
We want to predict whether a customer is going to return (order again from us) or not in the next 6 months.

## Getting Started

### Prerequisites
1. Docker

### Install

1. Build the container from Dockerfile
> ``` 
> $ make build-docker
> ```
2. Run the container
> ``` 
> $ make run-cont
Start jupyter inside the container
> ```
>$ make jupyter
Server will be on [http://127.0.0.1:9000](http://127.0.0.1:9000/) (You may need to add the token to the url) 

## Notes
1. The metric is `average precision`
2. You use make file for easier managing Docker


## Author

[Hadi Gharibi](https://github.com/hadi-gharibi)