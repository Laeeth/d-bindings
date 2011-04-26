// D Bindings for DirectX
// Ported by Sean Cavanaugh - WorksOnMyMachine@gmail.com

module win32.directx.dxinternal;


public import win32.directx.dxpublic;
import std.c.windows.com;


// This module is meant to never be imported by end-user code
// and also never be a public import for directx D bindings modules.

// This files primary function is to provide templates for the directx D 
// bindings to use (such as DX_DECLARE_IID), and to be a common reference
// for the raw enum values shared across separate version of DirectX


alias std.c.windows.com.IUnknown IUnknown;
alias std.c.windows.com.GUID GUID;
alias std.c.windows.com.IID IID;


version(DXSDK_JUNE_2010)
{
}
else
{
    static assert(false, "DirectX SDK version either unsupported or undefined");
}


// IID type using the value of the string passed in as-is
string DX_DECLARE_IID_RAW(string InterfaceName, string uuid)
{
    //static assert(uuid.length == 35);
    //static assert(uuid[8] == '-');
    //static assert(uuid[13] == '-');
    //static assert(uuid[18] == '-');
    string result = `immutable IID `~InterfaceName~
        ` = {0x`~uuid[0..8]~
        `,0x`~uuid[9..13]~
        `,0x`~uuid[14..18]~
        `,[0x`~uuid[19..21]~
        `,0x`~uuid[21..23]~
        `,0x`~uuid[24..26]~
        `,0x`~uuid[26..28]~
        `,0x`~uuid[28..30]~
        `,0x`~uuid[30..32]~
        `,0x`~uuid[32..34]~
        `,0x`~uuid[34..36]~
        `]};`;
    return result;
}


// IID type using the value of the string passed in and prefixed with IID_
string DX_DECLARE_IID(string InterfaceName, string uuid)
{
    return DX_DECLARE_IID_RAW(`IID_`~InterfaceName, uuid);
}


// This file contains structs and enumerations neutral to all versions of directx
// They typically get aliased to version specific names in their respective subsystems
// such as the following d3d11.d:
//   alias D3DCOLORVALUE D3D11COLORVALUE;
// or enums are initialized from values from within generig D3D_ enums located here


/////////////////////////
// D3D Common Constants (These are primarily things shared between D3D10 and D3D11)


enum D3D_DRIVER_TYPE : uint
{
    UNKNOWN = 0,
    HARDWARE,
    REFERENCE,
    NULL,
    SOFTWARE,
    WARP,
}


enum D3D_FEATURE_LEVEL : uint
{
    _9_1 = 0x9100,
    _9_2 = 0x9200,
    _9_3 = 0x9300,
    _10_0 = 0xa000,
    _10_1 = 0xa100,
    _11_0 = 0xb000,
}


enum D3D_PRIMITIVE_TOPOLOGY : uint
{
    UNDEFINED = 0,
    POINTLIST = 1,
    LINELIST = 2,
    LINESTRIP = 3,
    TRIANGLELIST = 4,
    TRIANGLESTRIP = 5,
    LINELIST_ADJ = 10,
    LINESTRIP_ADJ = 11,
    TRIANGLELIST_ADJ = 12,
    TRIANGLESTRIP_ADJ = 13,
    _1_CONTROL_POINT_PATCHLIST = 33,
    _2_CONTROL_POINT_PATCHLIST = 34,
    _3_CONTROL_POINT_PATCHLIST = 35,
    _4_CONTROL_POINT_PATCHLIST = 36,
    _5_CONTROL_POINT_PATCHLIST = 37,
    _6_CONTROL_POINT_PATCHLIST = 38,
    _7_CONTROL_POINT_PATCHLIST = 39,
    _8_CONTROL_POINT_PATCHLIST = 40,
    _9_CONTROL_POINT_PATCHLIST = 41,
    _10_CONTROL_POINT_PATCHLIST = 42,
    _11_CONTROL_POINT_PATCHLIST = 43,
    _12_CONTROL_POINT_PATCHLIST = 44,
    _13_CONTROL_POINT_PATCHLIST = 45,
    _14_CONTROL_POINT_PATCHLIST = 46,
    _15_CONTROL_POINT_PATCHLIST = 47,
    _16_CONTROL_POINT_PATCHLIST = 48,
    _17_CONTROL_POINT_PATCHLIST = 49,
    _18_CONTROL_POINT_PATCHLIST = 50,
    _19_CONTROL_POINT_PATCHLIST = 51,
    _20_CONTROL_POINT_PATCHLIST = 52,
    _21_CONTROL_POINT_PATCHLIST = 53,
    _22_CONTROL_POINT_PATCHLIST = 54,
    _23_CONTROL_POINT_PATCHLIST = 55,
    _24_CONTROL_POINT_PATCHLIST = 56,
    _25_CONTROL_POINT_PATCHLIST = 57,
    _26_CONTROL_POINT_PATCHLIST = 58,
    _27_CONTROL_POINT_PATCHLIST = 59,
    _28_CONTROL_POINT_PATCHLIST = 60,
    _29_CONTROL_POINT_PATCHLIST = 61,
    _30_CONTROL_POINT_PATCHLIST = 62,
    _31_CONTROL_POINT_PATCHLIST = 63,
    _32_CONTROL_POINT_PATCHLIST = 64,
}


/*
enum D3D10_PRIMITIVE_TOPOLOGY
{
    UNDEFINED = D3D_PRIMITIVE_TOPOLOGY.UNDEFINED,
    POINTLIST = D3D_PRIMITIVE_TOPOLOGY.POINTLIST,
    LINELIST = D3D_PRIMITIVE_TOPOLOGY.LINELIST,
    LINESTRIP = D3D_PRIMITIVE_TOPOLOGY.LINESTRIP,
    TRIANGLELIST = D3D_PRIMITIVE_TOPOLOGY.TRIANGLELIST,
    TRIANGLESTRIP = D3D_PRIMITIVE_TOPOLOGY.TRIANGLESTRIP,
    LINELIST_ADJ = D3D_PRIMITIVE_TOPOLOGY.LINELIST_ADJ,
    LINESTRIP_ADJ = D3D_PRIMITIVE_TOPOLOGY.LINESTRIP_ADJ,
    TRIANGLELIST_ADJ = D3D_PRIMITIVE_TOPOLOGY.TRIANGLELIST_ADJ,
    TRIANGLESTRIP_ADJ = D3D_PRIMITIVE_TOPOLOGY.TRIANGLESTRIP_ADJ,
}
*/


enum D3D_PRIMITIVE : uint
{
    UNDEFINED = 0,
    POINT = 1,
    LINE = 2,
    TRIANGLE = 3,
    LINE_ADJ = 6,
    TRIANGLE_ADJ = 7,
    _1_CONTROL_POINT_PATCH = 8,
    _2_CONTROL_POINT_PATCH = 9,
    _3_CONTROL_POINT_PATCH = 10,
    _4_CONTROL_POINT_PATCH = 11,
    _5_CONTROL_POINT_PATCH = 12,
    _6_CONTROL_POINT_PATCH = 13,
    _7_CONTROL_POINT_PATCH = 14,
    _8_CONTROL_POINT_PATCH = 15,
    _9_CONTROL_POINT_PATCH = 16,
    _10_CONTROL_POINT_PATCH = 17,
    _11_CONTROL_POINT_PATCH = 18,
    _12_CONTROL_POINT_PATCH = 19,
    _13_CONTROL_POINT_PATCH = 20,
    _14_CONTROL_POINT_PATCH = 21,
    _15_CONTROL_POINT_PATCH = 22,
    _16_CONTROL_POINT_PATCH = 23,
    _17_CONTROL_POINT_PATCH = 24,
    _18_CONTROL_POINT_PATCH = 25,
    _19_CONTROL_POINT_PATCH = 26,
    _20_CONTROL_POINT_PATCH = 28,
    _21_CONTROL_POINT_PATCH = 29,
    _22_CONTROL_POINT_PATCH = 30,
    _23_CONTROL_POINT_PATCH = 31,
    _24_CONTROL_POINT_PATCH = 32,
    _25_CONTROL_POINT_PATCH = 33,
    _26_CONTROL_POINT_PATCH = 34,
    _27_CONTROL_POINT_PATCH = 35,
    _28_CONTROL_POINT_PATCH = 36,
    _29_CONTROL_POINT_PATCH = 37,
    _30_CONTROL_POINT_PATCH = 38,
    _31_CONTROL_POINT_PATCH = 39,
    _32_CONTROL_POINT_PATCH = 40,
}


/*
enum D3D10_PRIMITIVE : uint
{
    UNDEFINED = D3D_PRIMITIVE.UNDEFINED,
    POINT = D3D_PRIMITIVE.POINT,
    LINE = D3D_PRIMITIVE.LINE,
    TRIANGLE = D3D_PRIMITIVE.TRIANGLE,
    LINE_ADJ = D3D_PRIMITIVE.LINE_ADJ,
    TRIANGLE_ADJ = D3D_PRIMITIVE.TRIANGLE_ADJ,
}
*/


enum D3D_SRV_DIMENSION : uint
{
    UNKNOWN = 0,
    BUFFER = 1,
    TEXTURE1D = 2,
    TEXTURE1DARRAY = 3,
    TEXTURE2D = 4,
    TEXTURE2DARRAY = 5,
    TEXTURE2DMS = 6,
    TEXTURE2DMSARRAY = 7,
    TEXTURE3D = 8,
    TEXTURECUBE = 9,
    TEXTURECUBEARRAY = 10,
    BUFFEREX = 11,
}


/*
enum D3D10_SRV_DIMENSION : uint
{
    UNKNOWN = D3D_SRV_DIMENSION.UNKNOWN,
    BUFFER = D3D_SRV_DIMENSION.BUFFER,
    TEXTURE1D = D3D_SRV_DIMENSION.TEXTURE1D,
    TEXTURE1DARRAY = D3D_SRV_DIMENSION.TEXTURE1DARRAY,
    TEXTURE2D = D3D_SRV_DIMENSION.TEXTURE2D,
    TEXTURE2DARRAY = D3D_SRV_DIMENSION.TEXTURE2DARRAY,
    TEXTURE2DMS = D3D_SRV_DIMENSION.TEXTURE2DMS,
    TEXTURE2DMSARRAY = D3D_SRV_DIMENSION.TEXTURE2DMSARRAY,
    TEXTURE3D = D3D_SRV_DIMENSION.TEXTURE3D,
    TEXTURECUBE = D3D_SRV_DIMENSION.TEXTURECUBE,
}
*/


/*
enum D3D10_1_SRV_DIMENSION : uint
{
    UNKNOWN = D3D_SRV_DIMENSION.UNKNOWN,
    BUFFER = D3D_SRV_DIMENSION.BUFFER,
    TEXTURE1D = D3D_SRV_DIMENSION.TEXTURE1D,
    TEXTURE1DARRAY = D3D_SRV_DIMENSION.TEXTURE1DARRAY,
    TEXTURE2D = D3D_SRV_DIMENSION.TEXTURE2D,
    TEXTURE2DARRAY = D3D_SRV_DIMENSION.TEXTURE2DARRAY,
    TEXTURE2DMS = D3D_SRV_DIMENSION.TEXTURE2DMS,
    TEXTURE2DMSARRAY = D3D_SRV_DIMENSION.TEXTURE2DMSARRAY,
    TEXTURE3D = D3D_SRV_DIMENSION.TEXTURE3D,
    TEXTURECUBE = D3D_SRV_DIMENSION.TEXTURECUBE,
    TEXTURECUBEARRAY = D3D_SRV_DIMENSION.TEXTURECUBEARRAY,
}
*/


enum D3D_SHADER_VARIABLE_CLASS : uint
{
    SCALAR = 0,
    VECTOR = ( SCALAR + 1 ) ,
    MATRIX_ROWS = ( VECTOR + 1 ) ,
    MATRIX_COLUMNS = ( MATRIX_ROWS + 1 ) ,
    OBJECT = ( MATRIX_COLUMNS + 1 ) ,
    STRUCT = ( OBJECT + 1 ) ,
    INTERFACE_CLASS = ( STRUCT + 1 ) ,
    INTERFACE_POINTER = ( INTERFACE_CLASS + 1 ) ,
}
alias D3D_SHADER_VARIABLE_CLASS D3D_SVC;


/*
enum D3D10_SHADER_VARIABLE_CLASS : uint
{
    SCALAR = D3D_SVC.SCALAR,
    VECTOR = D3D_SVC.VECTOR,
    MATRIX_ROWS = D3D_SVC.MATRIX_ROWS,
    MATRIX_COLUMNS = D3D_SVC.MATRIX_COLUMNS,
    OBJECT = D3D_SVC.OBJECT,
    STRUCT = D3D_SVC.STRUCT,
}
alias D3D10_SHADER_VARIABLE_CLASS D3D10_SVC;
*/


enum D3D_SHADER_VARIABLE_FLAGS : uint
{
    USERPACKED = 1,
    USED = 2,
    INTERFACE_POINTER = 4,
    INTERFACE_PARAMETER = 8,
}
alias D3D_SHADER_VARIABLE_FLAGS D3D_SVF;


/*
enum D3D10_SHADER_VARIABLE_FLAGS : uint
{
    D3D10_SVF_USERPACKED = D3D_SVF.USERPACKED,
    D3D10_SVF_USED = D3D_SVF.USED,
}
alias D3D10_SHADER_VARIABLE_FLAGS D3D10_SVF;
*/


enum D3D_SHADER_VARIABLE_TYPE : uint
{
    VOID = 0,
    BOOL = 1,
    INT = 2,
    FLOAT = 3,
    STRING = 4,
    TEXTURE = 5,
    TEXTURE1D = 6,
    TEXTURE2D = 7,
    TEXTURE3D = 8,
    TEXTURECUBE = 9,
    SAMPLER = 10,
    SAMPLER1D = 11,
    SAMPLER2D = 12,
    SAMPLER3D = 13,
    SAMPLERCUBE = 14,
    PIXELSHADER = 15,
    VERTEXSHADER = 16,
    PIXELFRAGMENT = 17,
    VERTEXFRAGMENT = 18,
    UINT = 19,
    UINT8 = 20,
    GEOMETRYSHADER = 21,
    RASTERIZER = 22,
    DEPTHSTENCIL = 23,
    BLEND = 24,
    BUFFER = 25,
    CBUFFER = 26,
    TBUFFER = 27,
    TEXTURE1DARRAY = 28,
    TEXTURE2DARRAY = 29,
    RENDERTARGETVIEW = 30,
    DEPTHSTENCILVIEW = 31,
    TEXTURE2DMS = 32,
    TEXTURE2DMSARRAY = 33,
    TEXTURECUBEARRAY = 34,
    HULLSHADER = 35,
    DOMAINSHADER = 36,
    INTERFACE_POINTER = 37,
    COMPUTESHADER = 38,
    DOUBLE = 39,
    RWTEXTURE1D = 40,
    RWTEXTURE1DARRAY = 41,
    RWTEXTURE2D = 42,
    RWTEXTURE2DARRAY = 43,
    RWTEXTURE3D = 44,
    RWBUFFER = 45,
    BYTEADDRESS_BUFFER = 46,
    RWBYTEADDRESS_BUFFER = 47,
    STRUCTURED_BUFFER = 48,
    RWSTRUCTURED_BUFFER = 49,
    APPEND_STRUCTURED_BUFFER = 50,
    CONSUME_STRUCTURED_BUFFER = 51,
}
alias D3D_SHADER_VARIABLE_TYPE D3D_SVT;


/*
enum D3D10_SHADER_VARIABLE_TYPE : uint
{
    VOID = D3D_SVT.VOID,
    BOOL = D3D_SVT.BOOL,
    INT = D3D_SVT.INT,
    FLOAT = D3D_SVT.FLOAT,
    STRING = D3D_SVT.STRING,
    TEXTURE = D3D_SVT.TEXTURE,
    TEXTURE1D = D3D_SVT.TEXTURE1D,
    TEXTURE2D = D3D_SVT.TEXTURE2D,
    TEXTURE3D = D3D_SVT.TEXTURE3D,
    TEXTURECUBE = D3D_SVT.TEXTURECUBE,
    SAMPLER = D3D_SVT.SAMPLER,
    SAMPLER1D = D3D_SVT.SAMPLER1D,
    SAMPLER2D = D3D_SVT.SAMPLER2D,
    SAMPLER3D = D3D_SVT.SAMPLER3D,
    SAMPLERCUBE = D3D_SVT.SAMPLERCUBE,
    PIXELSHADER = D3D_SVT.PIXELSHADER,
    VERTEXSHADER = D3D_SVT.VERTEXSHADER,
    PIXELFRAGMENT = D3D_SVT.PIXELFRAGMENT,
    VERTEXFRAGMENT = D3D_SVT.VERTEXFRAGMENT,
    UINT = D3D_SVT.UINT,
    UINT8 = D3D_SVT.UINT8,
    GEOMETRYSHADER = D3D_SVT.GEOMETRYSHADER,
    RASTERIZER = D3D_SVT.RASTERIZER,
    DEPTHSTENCIL = D3D_SVT.DEPTHSTENCIL,
    BLEND = D3D_SVT.BLEND,
    BUFFER = D3D_SVT.BUFFER,
    CBUFFER = D3D_SVT.CBUFFER,
    TBUFFER = D3D_SVT.TBUFFER,
    TEXTURE1DARRAY = D3D_SVT.TEXTURE1DARRAY,
    TEXTURE2DARRAY = D3D_SVT.TEXTURE2DARRAY,
    RENDERTARGETVIEW = D3D_SVT.RENDERTARGETVIEW,
    DEPTHSTENCILVIEW = D3D_SVT.DEPTHSTENCILVIEW,
    TEXTURE2DMS = D3D_SVT.TEXTURE2DMS,
    TEXTURE2DMSARRAY = D3D_SVT.TEXTURE2DMSARRAY,
    TEXTURECUBEARRAY = D3D_SVT.TEXTURECUBEARRAY,
}
alias D3D10_SHADER_VARIABLE_TYPE D3D10_SVT;
*/


enum D3D_SHADER_INPUT_FLAGS : uint
{
    USERPACKED = 1,
    COMPARISON_SAMPLER = 2,
    TEXTURE_COMPONENT_0 = 4,
    TEXTURE_COMPONENT_1 = 8,
    TEXTURE_COMPONENTS = 12,
}
alias D3D_SHADER_INPUT_FLAGS D3D_SIF;


/*
enum D3D10_SHADER_INPUT_FLAGS : uint
{
    USERPACKED = D3D_SIF.USERPACKED,
    COMPARISON_SAMPLER = D3D_SIF.COMPARISON_SAMPLER,
    TEXTURE_COMPONENT_0 = D3D_SIF.TEXTURE_COMPONENT_0,
    TEXTURE_COMPONENT_1 = D3D_SIF.TEXTURE_COMPONENT_1,
    TEXTURE_COMPONENTS = D3D_SIF.TEXTURE_COMPONENTS,
}
alias D3D10_SHADER_INPUT_FLAGS D3D10_SIF;
*/


enum D3D_SHADER_INPUT_TYPE : uint
{
    CBUFFER = 0,
    TBUFFER = ( CBUFFER + 1 ) ,
    TEXTURE = ( TBUFFER + 1 ) ,
    SAMPLER = ( TEXTURE + 1 ) ,
    UAV_RWTYPED = ( SAMPLER + 1 ) ,
    STRUCTURED = ( UAV_RWTYPED + 1 ) ,
    UAV_RWSTRUCTURED = ( STRUCTURED + 1 ) ,
    BYTEADDRESS = ( UAV_RWSTRUCTURED + 1 ) ,
    UAV_RWBYTEADDRESS = ( BYTEADDRESS + 1 ) ,
    UAV_APPEND_STRUCTURED = ( UAV_RWBYTEADDRESS + 1 ) ,
    UAV_CONSUME_STRUCTURED = ( UAV_APPEND_STRUCTURED + 1 ) ,
    UAV_RWSTRUCTURED_WITH_COUNTER = ( UAV_CONSUME_STRUCTURED + 1 ) ,
}
alias D3D_SHADER_INPUT_TYPE D3D_SIT;


/*
enum D3D10_SHADER_INPUT_TYPE : uint
{
    CBUFFER = D3D_SIT.CBUFFER,
    TBUFFER = D3D_SIT.TBUFFER,
    TEXTURE = D3D_SIT.TEXTURE,
    SAMPLER = D3D_SIT.SAMPLER,
}
alias D3D10_SHADER_INPUT_TYPE D3D10_SIT;
*/


enum D3D_SHADER_CBUFFER_FLAGS : uint
{
    USERPACKED = 1,
}
alias D3D_SHADER_CBUFFER_FLAGS D3D_CBF;


enum D3D10_SHADER_CBUFFER_FLAGS : uint
{
    USERPACKED = D3D_CBF.USERPACKED,
}
alias D3D10_SHADER_CBUFFER_FLAGS D3D10_CBF;


enum D3D_CBUFFER_TYPE : uint
{
    CBUFFER = 0,
    TBUFFER = ( CBUFFER + 1 ) ,
    INTERFACE_POINTERS = ( TBUFFER + 1 ) ,
    RESOURCE_BIND_INFO = ( INTERFACE_POINTERS + 1 ) ,
}
alias D3D_CBUFFER_TYPE D3D_CT;


/*
enum D3D10_CBUFFER_TYPE : uint
{
    D3D10_CT_CBUFFER = D3D_CT.CBUFFER,
    D3D10_CT_TBUFFER = D3D_CT.TBUFFER,
}
alias D3D10_CBUFFER_TYPE D3D10_CT;
*/


enum D3D_NAME : uint
{
    UNDEFINED = 0,
    POSITION = 1,
    CLIP_DISTANCE = 2,
    CULL_DISTANCE = 3,
    RENDER_TARGET_ARRAY_INDEX = 4,
    VIEWPORT_ARRAY_INDEX = 5,
    VERTEX_ID = 6,
    PRIMITIVE_ID = 7,
    INSTANCE_ID = 8,
    IS_FRONT_FACE = 9,
    SAMPLE_INDEX = 10,
    FINAL_QUAD_EDGE_TESSFACTOR = 11,
    FINAL_QUAD_INSIDE_TESSFACTOR = 12,
    FINAL_TRI_EDGE_TESSFACTOR = 13,
    FINAL_TRI_INSIDE_TESSFACTOR = 14,
    FINAL_LINE_DETAIL_TESSFACTOR = 15,
    FINAL_LINE_DENSITY_TESSFACTOR = 16,
    TARGET = 64,
    DEPTH = 65,
    COVERAGE = 66,
    DEPTH_GREATER_EQUAL = 67,
    DEPTH_LESS_EQUAL = 68,
}


/*
enum D3D10_NAME : uint
{
    UNDEFINED = D3D_NAME.UNDEFINED,
    POSITION = D3D_NAME.POSITION,
    CLIP_DISTANCE = D3D_NAME.CLIP_DISTANCE,
    CULL_DISTANCE = D3D_NAME.CULL_DISTANCE,
    RENDER_TARGET_ARRAY_INDEX = D3D_NAME.RENDER_TARGET_ARRAY_INDEX,
    VIEWPORT_ARRAY_INDEX = D3D_NAME.VIEWPORT_ARRAY_INDEX,
    VERTEX_ID = D3D_NAME.VERTEX_ID,
    PRIMITIVE_ID = D3D_NAME.PRIMITIVE_ID,
    INSTANCE_ID = D3D_NAME.INSTANCE_ID,
    IS_FRONT_FACE = D3D_NAME.IS_FRONT_FACE,
    SAMPLE_INDEX = D3D_NAME.SAMPLE_INDEX,
    TARGET = D3D_NAME.TARGET,
    DEPTH = D3D_NAME.DEPTH,
    COVERAGE = D3D_NAME.COVERAGE,
}
*/


enum D3D_RESOURCE_RETURN_TYPE : uint
{
    UNORM = 1,
    SNORM = 2,
    SINT = 3,
    UINT = 4,
    FLOAT = 5,
    MIXED = 6,
    DOUBLE = 7,
    CONTINUED = 8,
}
alias D3D_RESOURCE_RETURN_TYPE D3D_RETURN_TYPE;


/*
enum D3D10_RESOURCE_RETURN_TYPE : uint
{
    UNORM = D3D_RESOURCE_RETURN_TYPE.UNORM,
    SNORM = D3D_RESOURCE_RETURN_TYPE.SNORM,
    SINT = D3D_RESOURCE_RETURN_TYPE.SINT,
    UINT = D3D_RESOURCE_RETURN_TYPE.UINT,
    FLOAT = D3D_RESOURCE_RETURN_TYPE.FLOAT,
    MIXED = D3D_RESOURCE_RETURN_TYPE.MIXED,
}
alias D3D10_RESOURCE_RETURN_TYPE D3D10_RETURN_TYPE;
*/


enum D3D_REGISTER_COMPONENT_TYPE : uint
{
    UNKNOWN = 0,
    UINT32 = 1,
    SINT32 = 2,
    FLOAT32 = 3,
}
alias D3D_REGISTER_COMPONENT_TYPE D3D_REGISTER_COMPONENT;


/*
enum D3D10_REGISTER_COMPONENT_TYPE : uint
{
    UNKNOWN = D3D_REGISTER_COMPONENT.UNKNOWN,
    UINT32 = D3D_REGISTER_COMPONENT.UINT32,
    SINT32 = D3D_REGISTER_COMPONENT.SINT32,
    FLOAT32 = D3D_REGISTER_COMPONENT.FLOAT32,
}
alias D3D10_REGISTER_COMPONENT_TYPE D3D10_REGISTER_COMPONENT;
*/


enum D3D_TESSELLATOR_DOMAIN : uint
{
    UNDEFINED = 0,
    ISOLINE = 1,
    TRI = 2,
    QUAD = 3,
}


/* D3D_TESSELLATOR_DOMAIN not applicable to d3d10/d3d10.1 */


enum D3D_TESSELLATOR_PARTITIONING : uint
{
    UNDEFINED = 0,
    INTEGER = 1,
    POW2 = 2,
    FRACTIONAL_ODD = 3,
    FRACTIONAL_EVEN = 4,
}


/* D3D_TESSELLATOR_PARTITIONING not applicable to d3d10/d3d10.1 */


enum D3D_TESSELLATOR_OUTPUT_PRIMITIVE : uint
{
    UNDEFINED = 0,
    POINT = 1,
    LINE = 2,
    TRIANGLE_CW = 3,
    TRIANGLE_CCW = 4,
}
alias D3D_TESSELLATOR_OUTPUT_PRIMITIVE D3D_TESSELLATOR_OUTPUT;


/* D3D_TESSELLATOR_PARTITIONING not applicable to d3d10/d3d10.1 */


