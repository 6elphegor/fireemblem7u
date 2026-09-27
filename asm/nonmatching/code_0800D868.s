	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfnDeadAndFlagOnce
EvtCmd_GotoIfnDeadAndFlagOnce: @ 0x0800D868
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	ldrh r7, [r0, #8]
	ldr r5, [r0, #0xc]
	movs r4, #1
_0800D874:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D8AA
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D8AA
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800D8AA
	ldrb r0, [r2, #4]
	cmp r0, r7
	bne _0800D8AA
	adds r0, r5, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D8B0
	adds r0, r5, #0
	bl SetFlag
	movs r0, #0
	b _0800D8BA
_0800D8AA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D874
_0800D8B0:
	ldr r0, [r6, #0x30]
	ldr r1, [r0, #4]
	adds r0, r6, #0
	bl EventGotoLabel
_0800D8BA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
