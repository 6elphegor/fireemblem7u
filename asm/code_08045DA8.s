	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045DA8
sub_08045DA8: @ 0x08045DA8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, _08045E04 @ =0x03001400
	ldr r5, _08045E08 @ =0x0203DC9C
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r1, _08045E0C @ =0x081D5503
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r6, _08045E10 @ =0x03001420
	ldr r0, [r6, #4]
	bl EndMu
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	ldr r0, _08045E14 @ =0x0300141C
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _08045DF6
	ldr r0, [r6]
	mov r1, sp
	bl SetMuMoveScript
	movs r0, #7
	strb r0, [r7, #0x10]
_08045DF6:
	bl sub_08044B24
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045E04: .4byte 0x03001400
_08045E08: .4byte 0x0203DC9C
_08045E0C: .4byte 0x081D5503
_08045E10: .4byte 0x03001420
_08045E14: .4byte 0x0300141C
