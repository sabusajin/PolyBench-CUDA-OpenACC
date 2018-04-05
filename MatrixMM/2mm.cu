
#include <iostream>
#include <chrono>
#include "cuda_runtime.h"
#include "cuda.h"
#include "device_launch_parameters.h"
static void HandleError( cudaError_t err, const char *file, int line ) 
{
    if (err != cudaSuccess) 
    {
        printf( "%s in %s at line %d\n", cudaGetErrorString( err ),
                file, line );
        exit( EXIT_FAILURE );
    }
}
#define HANDLE_ERROR( err ) (HandleError( err, __FILE__, __LINE__ ))
#define SIZE 10

using namespace std;

void print_array (float array[][SIZE]) 
{

	for (int i=0; i<SIZE; i++) {
		for (int j=0; j<SIZE; j++) {
			cout<<array[i][j]<<" ";
		}
		cout<<endl;
	}
}

void initialize_array (float array[][SIZE]) 
{

	for (int i=0; i<SIZE; i++) {
		for (int j=0; j<SIZE; j++) {
			array[i][j] = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
		}
	}
}

void array_decl () 
{

	static float A[SIZE][SIZE];
	static float B[SIZE][SIZE];
	static float C[SIZE][SIZE];
	static float D[SIZE][SIZE];

	initialize_array(A);
	initialize_array(B);
	initialize_array(C);
	initialize_array(D);

	int *d_A, *d_B, *d_C, *d_D, *d_temp;

	HANDLE_ERROR(cudaMalloc((void**)&d_A, SIZE*SIZE*sizeof(float)));
	HANDLE_ERROR(cudaMalloc((void**)&d_B, SIZE*SIZE*sizeof(float)));
	HANDLE_ERROR(cudaMalloc((void**)&d_C, SIZE*SIZE*sizeof(float)));
	HANDLE_ERROR(cudaMalloc((void**)&d_D, SIZE*SIZE*sizeof(float)));
	HANDLE_ERROR(cudaMalloc((void**)&d_temp, SIZE*SIZE*sizeof(float)));

	cudaFree (d_A);
	cudaFree (d_B);
	cudaFree (d_C);
	cudaFree (d_D);
	cudaFree (d_temp);

}

int main (int argc, char **argv) {

	
	array_decl();







}