	.include "macro.inc"

	.syntax unified

	thumb_func_start IsCameraNotWatchingPosition
IsCameraNotWatchingPosition: @ 0x08015D70
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #4
	bl GetCameraAdjustedX
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #4
	adds r0, r5, #0
	bl GetCameraAdjustedY
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08015DA4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _08015DA8
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r2, r0
	bne _08015DA8
	movs r0, #0
	b _08015DAA
	.align 2, 0
_08015DA4: .4byte 0x0202BBB8
_08015DA8:
	movs r0, #1
_08015DAA:
	pop {r4, r5}
	pop {r1}
	bx r1
