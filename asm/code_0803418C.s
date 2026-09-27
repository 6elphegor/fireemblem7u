	.include "macro.inc"

	.syntax unified

	thumb_func_start CloseBattleForecast
CloseBattleForecast: @ 0x0803418C
	push {r4, lr}
	ldr r0, _080341B4 @ =0x08B96D5C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080341C0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080341B8
	bl ClearUi
	adds r0, r4, #0
	bl Proc_End
	b _080341C0
	.align 2, 0
_080341B4: .4byte 0x08B96D5C
_080341B8:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080341C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
