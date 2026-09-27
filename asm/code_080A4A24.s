	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4A24
sub_080A4A24: @ 0x080A4A24
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080A4A32
	bl EndSpriteAnimProc
_080A4A32:
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r2, [r5]
	cmp r2, #0x20
	bne _080A4A60
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A4AD6
	movs r0, #6
	bl SetNextGameAction
	b _080A4AD6
_080A4A60:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080A4AD6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080A4A98
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	movs r0, #0x80
	ldrh r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _080A4A90
	movs r0, #0xb
	bl SetNextGameAction
	b _080A4AD6
_080A4A90:
	movs r0, #5
	bl SetNextGameAction
	b _080A4AD6
_080A4A98:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A4AAE
	movs r0, #3
	bl ReadSuspendSave
	movs r0, #4
	bl SetNextGameAction
	b _080A4AD6
_080A4AAE:
	movs r0, #0x82
	ands r0, r2
	cmp r0, #0
	beq _080A4AC8
	adds r4, #0x2c
	ldrb r0, [r4]
	bl ReadGameSave
	ldrb r0, [r4]
	adds r0, #1
	bl SetNextGameAction
	b _080A4AD6
_080A4AC8:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A4AD6
	movs r0, #0
	bl SetNextGameAction
_080A4AD6:
	pop {r4, r5}
	pop {r0}
	bx r0
