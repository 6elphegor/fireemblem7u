	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076BE8
sub_08076BE8: @ 0x08076BE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08076C10 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08076C1C
	ldr r0, _08076C14 @ =0x0203E668
	ldr r1, _08076C18 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08076C2A
	.align 2, 0
_08076C10: .4byte 0x04000006
_08076C14: .4byte 0x0203E668
_08076C18: .4byte 0x0203E660
_08076C1C:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08076C2A:
	ldr r0, _08076C48 @ =0x04000054
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076C4C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076C48: .4byte 0x04000054
_08076C4C: .4byte 0x0203E668
