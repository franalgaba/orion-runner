// ===== 1D ===== //

#[cfg(test)]
mod tensor_1D {
    use array::SpanTrait;
    use traits::Into;

    use orion::operators::tensor::implementations::impl_tensor_fp::Tensor_fp;
    use orion::operators::tensor::core::{TensorTrait, };
    use orion::tests::helpers::tensor::fixed_point::fp8x23::fp_tensor_1x3_helper;
    use orion::numbers::fixed_point::implementations::impl_8x23::FP8x23Impl;

    #[test]
    #[available_gas(20000000)]
    fn tensor_cosh_test() {
        let tensor = fp_tensor_1x3_helper();
        let result = tensor.cosh().data;

        assert((*result.at(0).mag).into() == 8388608, 'result[0] = 0');
        assert((*result.at(1).mag).into() == 12944297, 'result[1] = 1.175201...');
        assert((*result.at(2).mag).into() == 31559577, 'result[2] = 3.62686...');

    }
}

// ===== 2D ===== //

#[cfg(test)]
mod tensor_2D {
    use array::SpanTrait;
    use traits::Into;

    use orion::operators::tensor::implementations::impl_tensor_fp::Tensor_fp;
    use orion::operators::tensor::core::{TensorTrait, };
    use orion::tests::helpers::tensor::fixed_point::fp8x23::fp_tensor_2x2_helper;
    use orion::numbers::fixed_point::implementations::impl_8x23::FP8x23Impl;

    #[test]
    #[available_gas(20000000)]
    fn tensor_cosh_test() {
        let tensor = fp_tensor_2x2_helper();
        let result = tensor.cosh().data;

        assert((*result.at(0).mag).into() == 8388608, 'result[0] = 0');
        assert((*result.at(1).mag).into() == 12944297, 'result[1] = 1.175201...');
        assert((*result.at(2).mag).into() == 31559577, 'result[2] = 3.62686...');
        assert((*result.at(3).mag).into() == 84453662, 'result[3] = 10.0179...');
    }
}

// ===== 3D ===== //

#[cfg(test)]
mod tensor_3D {
    use array::SpanTrait;
    use traits::Into;
    use debug::PrintTrait;


    use orion::operators::tensor::implementations::impl_tensor_fp::Tensor_fp;
    use orion::operators::tensor::core::{TensorTrait, };
    use orion::tests::helpers::tensor::fixed_point::fp8x23::fp_tensor_2x2x2_helper;
    use orion::numbers::fixed_point::implementations::impl_8x23::FP8x23Impl;

    #[test]
    #[available_gas(20000000)]
    fn tensor_cosh_test() {
        let tensor = fp_tensor_2x2x2_helper();
        let result = tensor.cosh().data;

        assert((*result.at(0).mag).into() == 8388608, 'result[0] = 1');
        assert((*result.at(1).mag).into() == 12944297, 'result[1] = 1.175201...');
        assert((*result.at(2).mag).into() == 31559577, 'result[2] = 3.62686...');
        assert((*result.at(3).mag).into() == 84453662, 'result[3] = 10.0179...');
        assert((*result.at(4).mag).into() == 229078021, 'result[4] = 27.2899...');
        assert((*result.at(5).mag).into() == 622518053, 'result[5] = 74.209...');
        assert((*result.at(6).mag).into() == 1692113052, 'result[6] = 201.7156...');
        assert((*result.at(7).mag).into() == 4599615728, 'result[7] = 548.3170...');
    }
}

