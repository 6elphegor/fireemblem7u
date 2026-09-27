	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcPrepSpChar_OnEnd
ProcPrepSpChar_OnEnd: @ 0x0808FA5C
	push {lr}
	ldr r0, [r0, #0x38]
	bl EndSpriteAnimProc
	pop {r0}
	bx r0
