	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08077CA4
sub_08077CA4: @ 0x08077CA4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077CCC @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077CD8
	ldr r0, _08077CD0 @ =0x0203E668
	ldr r1, _08077CD4 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077CE6
	.align 2, 0
_08077CCC: .4byte 0x04000006
_08077CD0: .4byte 0x0203E668
_08077CD4: .4byte 0x0203E660
_08077CD8:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077CE6:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08077D28
	ldr r0, _08077D30 @ =0x0400001C
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077D34 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08077D38 @ =0x0400001E
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077D34 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_08077D28:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077D30: .4byte 0x0400001C
_08077D34: .4byte 0x0203E668
_08077D38: .4byte 0x0400001E
