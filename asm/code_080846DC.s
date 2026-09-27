	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080846DC
sub_080846DC: @ 0x080846DC
	push {lr}
	ldr r0, _08084700 @ =0x08CC2A4C
	bl Proc_EndEach
	ldr r0, _08084704 @ =0x08CC2B84
	bl Proc_EndEach
	ldr r0, _08084708 @ =0x08CC2AAC
	bl Proc_EndEach
	ldr r0, _0808470C @ =0x08CC2ACC
	bl Proc_EndEach
	ldr r0, _08084710 @ =0x08CC2B6C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08084700: .4byte 0x08CC2A4C
_08084704: .4byte 0x08CC2B84
_08084708: .4byte 0x08CC2AAC
_0808470C: .4byte 0x08CC2ACC
_08084710: .4byte 0x08CC2B6C
