	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079568
sub_08079568: @ 0x08079568
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #1
_08079572:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08079614
	ldr r0, [r4]
	cmp r0, #0
	beq _08079614
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _08079614
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079614
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #7
	bl PidStatsRecordDefeatInfo
	adds r0, r4, #0
	bl UnitKill
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r0, _0807960C @ =0x0203A3F0
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _080795C0
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_080795C0:
	ldr r0, _08079610 @ =0x0203A470
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _080795D2
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_080795D2:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080795EA
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDrop
_080795EA:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807961A
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDeathDropLocation
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDrop
	b _0807961A
	.align 2, 0
_0807960C: .4byte 0x0203A3F0
_08079610: .4byte 0x0203A470
_08079614:
	adds r5, #1
	cmp r5, #0x3f
	ble _08079572
_0807961A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
