	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080469C4
sub_080469C4: @ 0x080469C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08046A48 @ =0x0300141C
	ldrb r0, [r0, #1]
	ldr r5, _08046A4C @ =0x0203DCA1
	movs r1, #0x34
	adds r1, r1, r6
	mov r8, r1
	movs r1, #0x38
	adds r1, r1, r6
	mov sb, r1
	str r1, [sp]
	movs r1, #1
	adds r2, r5, #0
	mov r3, r8
	bl sub_08044C10
	ldr r4, _08046A50 @ =0x03001400
	subs r5, #5
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r7, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _08046A26
	adds r2, r6, #0
	adds r2, #0x2c
	adds r3, r6, #0
	adds r3, #0x30
	adds r0, r7, #0
	movs r1, #0
	bl sub_08046464
_08046A26:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _08046A3A
	adds r0, r4, #0
	movs r1, #1
	mov r2, r8
	mov r3, sb
	bl sub_08046464
_08046A3A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046A48: .4byte 0x0300141C
_08046A4C: .4byte 0x0203DCA1
_08046A50: .4byte 0x03001400
