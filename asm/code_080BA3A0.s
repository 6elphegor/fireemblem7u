	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BA3A0
sub_080BA3A0: @ 0x080BA3A0
	ldr r0, _080BA3C0 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080BA3B0
	movs r2, #0
_080BA3B0:
	ldr r1, _080BA3C4 @ =0x04000052
	ldr r0, _080BA3C8 @ =0x08CEEF68
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BA3C0: .4byte 0x04000006
_080BA3C4: .4byte 0x04000052
_080BA3C8: .4byte 0x08CEEF68
