	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079B5C
sub_08079B5C: @ 0x08079B5C
	push {r4, lr}
	bl sub_08079BAC
	movs r4, #1
_08079B64:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08079BA0
	ldr r3, [r2]
	cmp r3, #0
	beq _08079BA0
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08079BA0
	ldr r0, _08079B9C @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _08079BA0
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _08079BA0
	adds r0, r2, #0
	bl UnitLevelUp
	movs r0, #0x90
	bl SetFlag
	b _08079BA6
	.align 2, 0
_08079B9C: .4byte 0x0001000C
_08079BA0:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079B64
_08079BA6:
	pop {r4}
	pop {r0}
	bx r0
