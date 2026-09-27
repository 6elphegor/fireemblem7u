	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitsAverageSupportValue
GetUnitsAverageSupportValue: @ 0x0809EBC0
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r7, _0809EBF0 @ =0x08CE3B5C
	ldr r0, [r7]
	cmp r0, #0
	beq _0809EC1C
	movs r6, #0
	adds r5, r7, #0
	adds r3, r7, #4
	adds r4, r7, #0
_0809EBD4:
	ldr r0, [r4]
	cmp r0, r2
	bne _0809EBE0
	ldr r0, [r3]
	cmp r0, r1
	bne _0809EBEC
_0809EBE0:
	ldr r0, [r4]
	cmp r0, r1
	bne _0809EBF4
	ldr r0, [r3]
	cmp r0, r2
	beq _0809EBFA
_0809EBEC:
	movs r0, #2
	b _0809EC1E
	.align 2, 0
_0809EBF0: .4byte 0x08CE3B5C
_0809EBF4:
	ldr r0, [r3]
	cmp r0, r2
	bne _0809EC00
_0809EBFA:
	ldr r0, [r4]
	cmp r0, r1
	bne _0809EBEC
_0809EC00:
	ldr r0, [r3]
	cmp r0, r1
	bne _0809EC0C
	ldr r0, [r5]
	cmp r0, r2
	bne _0809EBEC
_0809EC0C:
	adds r6, #8
	adds r5, #8
	adds r3, #8
	adds r4, #8
	adds r0, r6, r7
	ldr r0, [r0]
	cmp r0, #0
	bne _0809EBD4
_0809EC1C:
	movs r0, #3
_0809EC1E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
