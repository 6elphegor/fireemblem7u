	.include "macro.inc"

	.syntax unified

	thumb_func_start SpriteText_DrawBackground
SpriteText_DrawBackground: @ 0x08005C98
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldrb r0, [r7, #4]
	cmp r0, #0
	beq _08005CE2
	movs r0, #0
	strb r0, [r7, #2]
	ldr r4, _08005CEC @ =0x44444444
	str r4, [sp]
	ldr r5, _08005CF0 @ =0x02028D70
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldr r6, _08005CF4 @ =0x010000D8
	mov r0, sp
	adds r2, r6, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r4, sp, #4
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
_08005CE2:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005CEC: .4byte 0x44444444
_08005CF0: .4byte 0x02028D70
_08005CF4: .4byte 0x010000D8
