	.include "macro.inc"

	.syntax unified

	thumb_func_start ModifySaveLinkArenaStruct2A
ModifySaveLinkArenaStruct2A: @ 0x0809F834
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F848
	mov r4, sp
	mov r0, sp
	bl LoadAndVerfyLinkArenaStruct2
_0809F848:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809F862
	movs r0, #0
	b _0809F864
_0809F862:
	movs r0, #1
_0809F864:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1
