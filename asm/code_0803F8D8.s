	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F8D8
sub_0803F8D8: @ 0x0803F8D8
	ldr r0, _0803F900 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa0
	bhi _0803F924
	cmp r0, #0x27
	bhi _0803F90C
	ldr r1, _0803F904 @ =0x04000050
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0803F908 @ =0x00000F08
	adds r0, r2, #0
	strh r0, [r1]
	b _0803F924
	.align 2, 0
_0803F900: .4byte 0x04000006
_0803F904: .4byte 0x04000050
_0803F908: .4byte 0x00000F08
_0803F90C:
	ldr r1, _0803F928 @ =0x04000050
	ldr r2, _0803F92C @ =0x00000442
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0803F930 @ =0x04000052
	ldr r0, _0803F934 @ =0x030013F8
	ldrb r1, [r0]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_0803F924:
	bx lr
	.align 2, 0
_0803F928: .4byte 0x04000050
_0803F92C: .4byte 0x00000442
_0803F930: .4byte 0x04000052
_0803F934: .4byte 0x030013F8
