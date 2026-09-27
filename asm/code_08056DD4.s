	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxTeyariOBJ
NewEfxTeyariOBJ: @ 0x08056DD4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _08056E00 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056E04 @ =0x08BA168C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _08056E10
	ldr r2, _08056E08 @ =0x08BA5584
	ldr r3, _08056E0C @ =0x08BA57D8
	b _08056E14
	.align 2, 0
_08056E00: .4byte 0x0201774C
_08056E04: .4byte 0x08BA168C
_08056E08: .4byte 0x08BA5584
_08056E0C: .4byte 0x08BA57D8
_08056E10:
	ldr r2, _08056E34 @ =0x08BA5A38
	ldr r3, _08056E38 @ =0x08BA5C98
_08056E14:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08056E3C
	ldrh r0, [r4, #2]
	adds r0, #0x38
	b _08056E40
	.align 2, 0
_08056E34: .4byte 0x08BA5A38
_08056E38: .4byte 0x08BA5C98
_08056E3C:
	ldrh r0, [r4, #2]
	subs r0, #0x38
_08056E40:
	strh r0, [r4, #2]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
