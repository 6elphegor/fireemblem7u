	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC570
sub_080BC570: @ 0x080BC570
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x44
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BC5AC
	ldr r0, _080BC5B4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BC5AC
	movs r0, #2
	bl SetNextGameAction
	bl sub_080BC994
	bl sub_080BD55C
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #0x63
	bl Proc_Goto
_080BC5AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC5B4: .4byte 0x08B857F8
