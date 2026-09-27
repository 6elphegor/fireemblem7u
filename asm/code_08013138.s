	.include "macro.inc"

	.syntax unified

	thumb_func_start DecompressViaGenericBuf
DecompressViaGenericBuf: @ 0x08013138
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _08013164 @ =0x02020140
	adds r1, r6, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	bl GetDataSize
	cmp r0, #0
	bge _08013152
	adds r0, #3
_08013152:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013164: .4byte 0x02020140
