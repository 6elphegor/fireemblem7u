	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801265C
sub_0801265C: @ 0x0801265C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08002CA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08012678
	ldr r0, _08012680 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08012684
_08012678:
	adds r0, r4, #0
	bl Proc_Break
	b _080126C8
	.align 2, 0
_08012680: .4byte 0x08B857F8
_08012684:
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080126C8
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080126AC
	movs r0, #3
	bl ReadSuspendSave
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080126C8
_080126AC:
	movs r0, #0x5a
	movs r1, #0
	bl StartBgmCore
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x3c
	movs r3, #0
	bl StartBgmVolumeChange
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080126C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
