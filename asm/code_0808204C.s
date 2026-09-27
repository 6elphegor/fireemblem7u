	.include "macro.inc"

	.syntax unified

	thumb_func_start GetLastHelpBoxInfo
GetLastHelpBoxInfo: @ 0x0808204C
	ldr r0, _08082054 @ =0x0203E690
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08082054: .4byte 0x0203E690
