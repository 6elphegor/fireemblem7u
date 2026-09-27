	.include "macro.inc"

	.syntax unified

	thumb_func_start SwingSwordfx_Init
SwingSwordfx_Init: @ 0x08021174
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _080211A4 @ =0x02022860
	ldr r2, _080211A8 @ =0x00007FFF
	adds r1, r3, #0
	adds r1, #0x42
	movs r0, #0xe
_08021182:
	strh r2, [r1]
	adds r1, #2
	subs r0, #1
	cmp r0, #0
	bge _08021182
	movs r4, #0
	ldr r0, _080211A8 @ =0x00007FFF
	strh r0, [r3]
	bl EnablePalSync
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080211A4: .4byte 0x02022860
_080211A8: .4byte 0x00007FFF
