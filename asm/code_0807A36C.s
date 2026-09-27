	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A36C
sub_0807A36C: @ 0x0807A36C
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807A384 @ =0x0000176F
	cmp r0, r1
	ble _0807A37C
	movs r2, #1
_0807A37C:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A384: .4byte 0x0000176F
