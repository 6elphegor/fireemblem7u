	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08058D74
sub_08058D74: @ 0x08058D74
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_08058D7A:
	ldr r0, [r5, #0x5c]
	adds r1, r4, #0
	bl StartSubSpell_efxFimbulvetrOBJ2Fall
	adds r4, #1
	cmp r4, #0x1b
	ble _08058D7A
	ldr r1, _08058D9C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058D9C: .4byte 0x0201774C
