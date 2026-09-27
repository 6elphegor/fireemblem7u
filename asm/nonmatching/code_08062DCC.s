	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxSunakemuri
NewEfxSunakemuri: @ 0x08062DCC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08062DF4 @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _08062DEE
	ldr r0, _08062DF8 @ =0x08BA4404
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	adds r1, r6, #0
	bl NewEfxSunakemuriOBJ
_08062DEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062DF4: .4byte 0x0201774C
_08062DF8: .4byte 0x08BA4404
