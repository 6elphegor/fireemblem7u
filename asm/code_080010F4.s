	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080010F4
sub_080010F4: @ 0x080010F4
	push {r4, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08001124 @ =0x02022860
	adds r0, r1, r0
	str r0, [r7, #0x14]
	ldr r0, [r7]
	str r0, [r7, #0x18]
	movs r0, #0
	str r0, [r7, #0x10]
_08001118:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _08001128
	b _080011A2
	.align 2, 0
_08001124: .4byte 0x02022860
_08001128:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	ldrh r2, [r1]
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	ldr r2, [r7, #0xc]
	muls r1, r2, r1
	asrs r2, r1, #6
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	ldr r2, [r7, #0x18]
	ldrh r3, [r2]
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, [r7, #0xc]
	muls r2, r3, r2
	asrs r3, r2, #6
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r2, r3
	adds r1, r1, r2
	ldr r2, [r7, #0x18]
	ldrh r3, [r2]
	movs r4, #0xf8
	lsls r4, r4, #7
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, [r7, #0xc]
	muls r2, r3, r2
	asrs r3, r2, #6
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r2, r3
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #2
	str r1, [r7, #0x14]
	ldr r0, [r7, #0x18]
	adds r1, r0, #2
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _08001118
_080011A2:
	bl EnablePalSync
	add sp, #0x1c
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
