	.include "macro.inc"

	.syntax unified

	thumb_func_start InitScanlineEffect
InitScanlineEffect: @ 0x0807685C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0807688C @ =0x0203E160
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _08076890 @ =0x0203E3E0
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r0, _08076894 @ =0x0203E660
	ldr r1, _0807688C @ =0x0203E160
	str r1, [r0]
	ldr r0, _08076894 @ =0x0203E660
	ldr r1, _08076890 @ =0x0203E3E0
	str r1, [r0, #4]
	ldr r0, _08076898 @ =0x0203E668
	ldr r1, _08076894 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807688C: .4byte 0x0203E160
_08076890: .4byte 0x0203E3E0
_08076894: .4byte 0x0203E660
_08076898: .4byte 0x0203E668
