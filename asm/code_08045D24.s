	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045D24
sub_08045D24: @ 0x08045D24
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, _08045D9C @ =0x03001400
	ldr r5, _08045DA0 @ =0x0203DC9C
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0x2c]
	movs r1, #0
	mov sb, r1
	mov r1, r8
	strb r0, [r1, #0x10]
	ldr r0, [r6, #0x30]
	strb r0, [r1, #0x11]
	ldr r0, [r6, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r6, #0x38]
	strb r0, [r4, #0x11]
	ldr r5, _08045DA4 @ =0x03001420
	ldr r1, [r5]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, r8
	movs r2, #6
	movs r3, #5
	bl sub_08047A00
	ldr r1, [r5, #4]
	mov r0, sb
	str r0, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r2, #8
	movs r3, #5
	bl sub_08047A00
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045D9C: .4byte 0x03001400
_08045DA0: .4byte 0x0203DC9C
_08045DA4: .4byte 0x03001420
