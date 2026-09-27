	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LoadUnit
EvtCmd_LoadUnit: @ 0x0800D258
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, [r0, #0x30]
	ldrb r1, [r0, #4]
	mov sb, r1
	ldrb r3, [r0, #6]
	mov sl, r3
	ldrb r6, [r0, #8]
	ldrb r0, [r0, #0xa]
	mov r8, r0
	ldr r0, _0800D2EC @ =0x030041D0
	ldr r5, _0800D2F0 @ =0x08B91A18
	ldrb r1, [r5, #2]
	strb r1, [r0, #2]
	ldrb r4, [r5, #3]
	lsls r2, r4, #0x1f
	lsrs r2, r2, #0x1f
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r0, #3]
	ands r1, r3
	orrs r1, r2
	movs r2, #6
	ands r2, r4
	movs r3, #7
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r2
	lsrs r4, r4, #3
	lsls r4, r4, #3
	movs r2, #7
	ands r1, r2
	orrs r1, r4
	strb r1, [r0, #3]
	ldrb r1, [r5, #8]
	strb r1, [r0, #8]
	ldrb r1, [r5, #9]
	strb r1, [r0, #9]
	ldrb r1, [r5, #0xa]
	strb r1, [r0, #0xa]
	ldrb r1, [r5, #0xb]
	strb r1, [r0, #0xb]
	ldrb r1, [r5, #0xc]
	strb r1, [r0, #0xc]
	ldrb r1, [r5, #0xd]
	strb r1, [r0, #0xd]
	ldrb r1, [r5, #0xe]
	strb r1, [r0, #0xe]
	ldrb r1, [r5, #0xf]
	strb r1, [r0, #0xf]
	mov r1, sb
	strb r1, [r0]
	mov r3, sl
	strb r3, [r0, #1]
	strb r6, [r0, #4]
	mov r1, r8
	strb r1, [r0, #5]
	strb r6, [r0, #6]
	strb r1, [r0, #7]
	movs r1, #0
	bl LoadUnitCore
	movs r0, #2
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D2EC: .4byte 0x030041D0
_0800D2F0: .4byte 0x08B91A18
