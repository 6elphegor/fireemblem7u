	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetAiPid
EvtCmd_SetAiPid: @ 0x0800E254
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, [r0, #0x30]
	ldrb r1, [r0, #4]
	mov r8, r1
	ldr r1, [r0, #8]
	ldrb r7, [r0, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r6, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	movs r4, #1
_0800E276:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800E2A4
	ldr r3, [r2]
	cmp r3, #0
	beq _0800E2A4
	ldr r0, [r2, #0xc]
	movs r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0800E2A4
	ldrb r3, [r3, #4]
	cmp r3, r8
	bne _0800E2A4
	adds r0, r2, #0
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl EventSetUnitAi
_0800E2A4:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800E276
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
