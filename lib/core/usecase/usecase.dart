abstract class Usecase<ReturnType, Params> {
  ReturnType call(Params params);
}

// when no params to pass we use this class
class NoParams{}
