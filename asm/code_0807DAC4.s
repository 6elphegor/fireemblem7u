	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DAC4
sub_0807DAC4: @ 0x0807DAC4
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r6, #9
	movs r5, #1
_0807DACC:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807DB64
	ldr r0, [r4]
	cmp r0, #0
	beq _0807DB64
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _0807DB64
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #6
	bl PidStatsRecordDefeatInfo
	adds r0, r4, #0
	bl UnitKill
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r0, _0807DB5C @ =0x0203A3F0
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _0807DB10
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_0807DB10:
	ldr r0, _0807DB60 @ =0x0203A470
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _0807DB22
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_0807DB22:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807DB3A
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDrop
_0807DB3A:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807DB6A
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDeathDropLocation
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDrop
	b _0807DB6A
	.align 2, 0
_0807DB5C: .4byte 0x0203A3F0
_0807DB60: .4byte 0x0203A470
_0807DB64:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807DACC
_0807DB6A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
