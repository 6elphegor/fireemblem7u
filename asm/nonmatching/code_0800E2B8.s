	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetAiPosition
EvtCmd_SetAiPosition: @ 0x0800E2B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, [r0, #0x30]
	ldr r1, [r2, #8]
	ldrb r0, [r2, #8]
	mov sb, r0
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	mov r8, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r7, r1, #0x10
	movs r4, #0x41
	movs r6, #4
	ldrsb r6, [r2, r6]
	movs r5, #6
	ldrsb r5, [r2, r5]
_0800E2E4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800E31C
	ldr r0, [r2]
	cmp r0, #0
	beq _0800E31C
	ldr r0, [r2, #0xc]
	movs r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0800E31C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _0800E31C
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0800E31C
	adds r0, r2, #0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl EventSetUnitAi
_0800E31C:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800E2E4
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
